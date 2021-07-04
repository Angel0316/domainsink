<?php
    $getname = str_replace("-", ".", $_GET['name']);
    
            $servername = "localhost";
            $username = "trckcxyz_crang";
            $password = "@molecula12";
            $dbname = "trckcxyz_parked";
            $conn = new mysqli($servername, $username, $password, $dbname);

            $tbl = 'parked_track';
            $others = "'Other'";
            $good = '1';
            $zero = '0';
            $name = "'".$getname."'";
            
            $sqloffer = "SELECT * FROM parked_domains WHERE name = $name";
            $resoffer = $conn->query($sqloffer);
            
            $check = mysqli_num_rows($resoffer);
            
            function traffic($traffic)
            {
                $alltraffic =  explode('|', $traffic);

                return $alltraffic[0];
            }
        
            
            if ($check != 0) {
                while ($rowo = $resoffer->fetch_assoc()) {
                    $askedprice = $rowo ['askedprice'];
                    $auction = $rowo ['auction'];
                    $bids = $rowo ['bids'];
                    $bidders = $rowo ['bidders'];
                    $mil = $rowo ['end_time_stamp'];
                    $reg = $rowo ['registrar'];
                    $domname = $rowo ['name'];
                    $domid = $rowo ['id'];
                    $traffic = $rowo ['traffic'];

                    $seconds = $mil / 1000;
                    $end_time_stamp = date('l, F d, Y G:i:s A T', $seconds);
                    $lastupdate = date('l, F d, Y G:i:s A T', $rowo ['lastupdate']);

                    if (!isset($bids)) {
                        $bids = 0;
                    }
                    if (!isset($bidders)) {
                        $bidders = 0;
                    }

                    /*
                    if ($reg == 1 || $reg == 2) { $registrar = "DYNADOT"; $reglink = "https://www.domainsink.com/dynadot/".$domid; }
                    if ($reg == 3 || $reg == 4) { $registrar = "NAMESILO"; $reglink = "https://www.domainsink.com/namesilo"; }
                    if ($reg == 5) { $registrar = "GODADDY"; $reglink = "https://www.godaddy.com"; }
                    */
                    $registrar = "DAN.com";
                    $reglink = "https://dan.com/buy-domain/".$domname;
                }
            } else {
                echo "This domain is not listed on our marketplace!";
            
                exit();
            }
            
            

        $sqlcount = "SELECT * FROM $tbl WHERE domain = $domid and good = $good";
        $sqlcountgender = "SELECT * FROM $tbl WHERE domain = $domid and good = $good and gender !=$zero";
        $sqlcountage = "SELECT * FROM $tbl WHERE domain = $domid and good = $good and age !=$zero";
        $sqlcountinterest = "SELECT * FROM $tbl WHERE domain = $domid and good = $good and interest !=$zero";
        $sqlsoi = "SELECT * FROM parked_subscribers WHERE domid = $domid and confirmed = $zero";
        $sqldoi = "SELECT * FROM parked_subscribers WHERE domid = $domid and confirmed = $good";

        $res = $conn->query($sqlcount);
        $resgender = $conn->query($sqlcountgender);
        $sqlcountage = $conn->query($sqlcountage);
        $resinterest = $conn->query($sqlcountinterest);
        $ressoi = $conn->query($sqlsoi);
        $resdoi = $conn->query($sqldoi);
    

        $rowcount = mysqli_num_rows($res);
        $rowcountgender = mysqli_num_rows($resgender);
        $sqlcountage = mysqli_num_rows($sqlcountage);
        $rowinterest = mysqli_num_rows($resinterest);
        $rowsoi = mysqli_num_rows($ressoi);
        $rowsdoi = mysqli_num_rows($resdoi);
    


        $leads = $rowsoi + $rowsdoi;

                if ($leads != 0) {
                    $soi = $rowsoi*100/$leads;
                    $percentsoi = round($soi, 1, PHP_ROUND_HALF_UP);

                    $doi = $rowsdoi*100/$leads;
                    $percentdoi = round($doi, 1, PHP_ROUND_HALF_UP);
                } else {
                    $percentsoi = 0;
                    $percentdoi = 0;
                }


        $sqliterests = "SELECT c.category, t.category as catid, t.qid
					FROM parked_domains c
					LEFT JOIN parked_interests t
					ON t.category = c.category WHERE c.id = $domid";

        $resultiterests = $conn->query($sqliterests);

        $dataiterests = array();


            while ($row = $resultiterests->fetch_assoc()) {
                $catid = $row ['catid'];
                $qid = $row ['qid'];

                $dataiterests[] = array('category'=>$catid, 'qid'=>$qid);
            }



        $sqla ="with top10 as
			(select count(id) as counted,referrer
			from $tbl WHERE domain = $domid and good = $good
			GROUP BY referrer ORDER by 1 DESC LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as referrer
			from $tbl
			where referrer not in
			(select referrer
			from top10 ) and domain = $domid and good = $good";

        $resulta = $conn->query($sqla);

        $dataa = array();


            while ($row = $resulta->fetch_assoc()) {
                $referrer = $row ['referrer'];
                $counteda = $row ['counted'];

                $dataa[] = array('ref'=>$row['referrer'], 'hits'=>$row['counted']);
            }


            if ($rowcount > 0) {
                foreach ($dataa as $key => $valuea) {
                    $percenta = $valuea['hits']*100/$rowcount;
                    $percentagea = round($percenta, 1, PHP_ROUND_HALF_UP);

                    $vlauesa['label'][] = $valuea['ref'];
                    $vlauesa['data'][] = $percentagea;
                }
            } else {
                $vlauesa['label'][] = 'NO DATA YET';
                $vlauesa['data'][] = '0';
            }
                $chart_referrer = json_encode($vlauesa);

    
        $sqlb ="with top10 as
			(select count(id) as counted,country
			from $tbl WHERE domain = $domid and good = $good
			GROUP BY country ORDER by 1 DESC  LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as country
			from $tbl
			where country not in
			(select country
			from top10 ) and domain = $domid and good = $good";

        $resultb = $conn->query($sqlb);

        $datab = array();

            while ($row = $resultb->fetch_assoc()) {
                $country = $row ['country'];
                $countedb = $row ['counted'];

                $datab[] = array('country'=>$row['country'], 'hits'=>$row['counted']);
            }


            if ($rowcount > 0) {
                foreach ($datab as $key => $valueb) {
                    $percentb = $valueb['hits']*100/$rowcount;
                    $percentageb = round($percentb, 1, PHP_ROUND_HALF_UP);

                    $vlauesb['label'][] = $valueb['country'];
                    $vlauesb['data'][] = $percentageb;
                }
            } else {
                $vlauesb['label'][] = 'NO DATA YET';
                $vlauesb['data'][] = '0';
            }
                $chart_geo = json_encode($vlauesb);

        $sqlc ="with top10 as
			(select count(id) as counted,browser
			from $tbl WHERE domain = $domid and good = $good
			GROUP BY browser ORDER by 1 DESC  LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as browser
			from $tbl
			where browser not in
			(select browser
			from top10 ) and domain = $domid and good = $good";

        $resultc = $conn->query($sqlc);

            $datac = array();

            while ($row = $resultc->fetch_assoc()) {
                $browser = $row ['browser'];
                $countedc = $row ['counted'];

                $datac[] = array('browser'=>$row['browser'], 'hits'=>$row['counted']);
            }


            if ($rowcount > 0) {
                foreach ($datac as $key => $valuec) {
                    $percentc = $valuec['hits']*100/$rowcount;
                    $percentagec = round($percentc, 1, PHP_ROUND_HALF_UP);

                    $vlauesc['label'][] = $valuec['browser'];
                    $vlauesc['data'][] = $percentagec;
                }
            } else {
                $vlauesc['label'][] = 'NO DATA YET';
                $vlauesc['data'][] = '0';
            }
            $chart_browser = json_encode($vlauesc);


            $sqld ="with top10 as
			(select count(id) as counted,os
			from $tbl WHERE domain = $domid and good = $good
			GROUP BY os ORDER by 1 DESC  LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as os
			from $tbl
			where os not in
			(select os
			from top10 ) and domain = $domid and good = $good";

        $resultd = $conn->query($sqld);

        $datad = array();

            while ($row = $resultd->fetch_assoc()) {
                $os = $row ['os'];
                $countedd = $row ['counted'];

                $datad[] = array('os'=>$row['os'], 'hits'=>$row['counted']);
            }


            if ($rowcount > 0) {
                foreach ($datad as $key => $valued) {
                    $percentd = $valued['hits']*100/$rowcount;
                    $percentaged = round($percentd, 1, PHP_ROUND_HALF_UP);

                    $vlauesd['label'][] = $valued['os'];
                    $vlauesd['data'][] = $percentaged;
                }
            } else {
                $vlauesd['label'][] = 'NO DATA YET';
                $vlauesd['data'][] = '0';
            }
            $chart_os = json_encode($vlauesd);

            $sqle ="with top10 as
			(select count(id) as counted,gender
			from $tbl WHERE domain = $domid and good = $good and gender != $zero
			GROUP BY gender ORDER by 1 DESC LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as gender
			from $tbl
			where gender not in
			(select gender
			from top10 ) and domain = $domid and good = $good and gender != $zero";

        $resulte = $conn->query($sqle);

        $datae = array();

            while ($row = $resulte->fetch_assoc()) {
                $gender = $row ['gender'];
                $countede = $row ['counted'];

                $datae[] = array('gender'=>$row['gender'], 'hits'=>$row['counted']);
            }


            if ($rowcountgender > 0) {
                foreach ($datae as $key => $valuee) {
                    $percente = $valuee['hits']*100/$rowcountgender;
                    $percentagee = round($percente, 1, PHP_ROUND_HALF_UP);

                    if ($valuee['gender'] != "Others" && $valuee['hits'] != 0) {
                        if ($valuee['gender'] == 1) {
                            $gender= "Males";
                        }
                        if ($valuee['gender'] == 2) {
                            $gender= "Females";
                        }

                        $vlauese['label'][] = $gender;
                        $vlauese['data'][] = $percentagee;
                    }
                }
            } else {
                $vlauese['label'][] = 'NO DATA YET';
                $vlauese['data'][] = '0';
            }
            $chart_gender = json_encode($vlauese);


        $sqlf ="with top10 as
			(select count(id) as counted,age
			from $tbl WHERE domain = $domid and good = $good and age != $zero
			GROUP BY age ORDER by 1 DESC LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as age
			from $tbl
			where age not in
			(select age
			from top10 ) and domain = $domid and good = $good and age != $zero";

        $resultf = $conn->query($sqlf);

        $dataf = array();

            while ($row = $resultf->fetch_assoc()) {
                $agf = $row ['age'];
                $countedf = $row ['counted'];

                $dataf[] = array('age'=>$row['age'], 'hits'=>$row['counted']);
            }


            if ($sqlcountage > 0) {
                foreach ($dataf as $key => $valuef) {
                    $percentf = $valuef['hits']*100/$sqlcountage;
                    $percentagef = round($percentf, 1, PHP_ROUND_HALF_UP);

                    if ($valuef['age'] != "Others" && $valuef['hits'] != 0) {
                        if ($valuef['age'] == 1) {
                            $age= "18-25";
                        }
                        if ($valuef['age'] == 2) {
                            $age= "26-35";
                        }
                        if ($valuef['age'] == 3) {
                            $age= "36-45";
                        }
                        if ($valuef['age'] == 4) {
                            $age= "46+";
                        }

                        $vlauesf['label'][] = $age;
                        $vlauesf['data'][] = $percentagef;
                    }
                }
            } else {
                $vlauesf['label'][] = 'NO DATA YET';
                $vlauesf['data'][] = '0';
            }
            $chart_age = json_encode($vlauesf);


        $sqlg ="select count(c.id) as counted,t.answer
			from $tbl c 
			LEFT JOIN parked_interests t
			ON t.qid = c.interest and t.category = c.category 
			WHERE c.domain = $domid and c.good = $good and c.interest != $zero
			GROUP BY c.interest ORDER by 1 DESC";

        $resultg = $conn->query($sqlg);

                if ($rowinterest > 0) {
                    while ($row = $resultg->fetch_assoc()) {
                        $percentg = $row['counted']*100/$rowinterest;
                        $percentageg = round($percentg, 1, PHP_ROUND_HALF_UP);
                        $vlauesg['label'][] = $row['answer'];
                        $vlauesg['data'][] = $percentageg;
                    }
                } else {
                    $vlauesg['label'][] = 'NO DATA YET';
                    $vlauesg['data'][] = '0';
                }
                $chart_interest = json_encode($vlauesg);



?>
<script>
$(function() {

    var domid = <?php echo $domid; ?>;

    var cData = JSON.parse(`<?php echo $chart_referrer; ?>`);
    var PullData = {
        labels: cData.label,
        datasets: [{
            data: cData.data,
            backgroundColor: [
                "#6699ff",
                "#ff9933",
                "#9db569",
                "#cc0000",
                "#999999",
                "#cc6699",
                "#ffff00",
                "#996633",
                "#00ff00",
                "#cc66cc",
            ]
        }]
    };
    var cData2 = JSON.parse(`<?php echo $chart_geo; ?>`);
    var PullData2 = {
        labels: cData2.label,
        datasets: [{
            data: cData2.data,
            backgroundColor: [
                "#996699",
                "#ffcc33",
                "#6600ff",
                "#99cc33",
                "#cc99cc",
                "#00ff00",
                "#ffff00",
                "#996633",
                "#00ff00",
                "#cc66cc",
            ]
        }]
    };
    var cData3 = JSON.parse(`<?php echo $chart_browser; ?>`);
    var PullData3 = {
        labels: cData3.label,
        datasets: [{
            data: cData3.data,
            backgroundColor: [
                "#cc33ff",
                "#cccc66",
                "#6666ff",
                "#ff6600",
                "#cc0099",
                "#996666",
                "#ffff00",
                "#996633",
                "#00ff00",
                "#cc66cc",
            ]
        }]
    };

    var cData4 = JSON.parse(`<?php echo $chart_os; ?>`);
    var PullData4 = {
        labels: cData4.label,
        datasets: [{
            data: cData4.data,
            backgroundColor: [

                "#00ff00",
                "#ffff00",
                "#cc33ff",
                "#ff6600",
                "#cc0099",
                "#cccc66",
                "#6666ff",
                "#996666",
                "#cc66cc",
                "#996633",
            ]
        }]
    };

    var cData5 = JSON.parse(`<?php echo $chart_gender; ?>`);
    var PullData5 = {
        labels: cData5.label,
        datasets: [{
            data: cData5.data,
            backgroundColor: [
                "#99cc00",
                "#0066cc",
            ]
        }]
    };

    var cData6 = JSON.parse(`<?php echo $chart_age; ?>`);
    var PullData6 = {
        labels: cData6.label,
        datasets: [{
            data: cData6.data,
            backgroundColor: [

                "#cc66cc",
                "#996633",
                "#cc33ff",
                "#cccc66",
            ]
        }]
    };

    var cData7 = JSON.parse(`<?php echo $chart_interest; ?>`);
    var PullData7 = {
        labels: cData7.label,
        datasets: [{
            data: cData7.data,
            backgroundColor: [
                "#cc0099",
                "#996633",
                "#ffff00",
                "#ff6600",
            ]
        }]
    };

    var ctx = document.getElementById("refChart" + domid);
    ctx.width = 300;
    ctx.height = 300;
    var chartInstance = new Chart(ctx, {
        type: 'pie',
        data: PullData,
        options: {
            title: {
                display: true,
                fontsize: 12
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: { 
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false,
        }
    });

    var ctx2 = document.getElementById("geoChart" + domid);
    ctx2.width = 300;
    ctx2.height = 300;
    var chartInstance = new Chart(ctx2, {
        type: 'pie',
        data: PullData2,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);
                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });

    var ctx3 = document.getElementById("browsersChart" + domid);
    ctx3.width = 300;
    ctx3.height = 300;
    var chartInstance = new Chart(ctx3, {
        type: 'pie',
        data: PullData3,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });

    var ctx4 = document.getElementById("osChart" + domid);
    ctx4.width = 300;
    ctx4.height = 300;
    var chartInstance = new Chart(ctx4, {
        type: 'pie',
        data: PullData4,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });

    var ctx5 = document.getElementById("genderChart" + domid);
    ctx5.width = 300;
    ctx5.height = 300;
    var chartInstance = new Chart(ctx5, {
        type: 'pie',
        data: PullData5,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });

    var ctx6 = document.getElementById("ageChart" + domid);
    ctx6.width = 300;
    ctx6.height = 300;
    var chartInstance = new Chart(ctx6, {
        type: 'pie',
        data: PullData6,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });


    var ctx7 = document.getElementById("interestChart" + domid);
    ctx7.width = 300;
    ctx7.height = 300;
    var chartInstance = new Chart(ctx7, {
        type: 'pie',
        data: PullData7,
        options: {
            title: {
                display: true,
                fontsize: 12,
            },
            tooltips: {
                custom: function(tooltip) {
                    if (!tooltip) return;
                    // disable displaying the color box;
                    tooltip.displayColors = false;
                },
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + '%';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            legend: {
                display: true,
                position: 'right',
                labels: {
                    generateLabels: function(chart) {
                        var data = chart.data;
                        if (data.labels.length && data.datasets.length) {
                            return data.labels.map(function(label, i) {
                                var meta = chart.getDatasetMeta(0);
                                var ds = data.datasets[0];
                                var arc = meta.data[i];
                                var custom = arc && arc.custom || {};
                                var getValueAtIndexOrDefault = Chart.helpers
                                    .getValueAtIndexOrDefault;
                                var arcOpts = chart.options.elements.arc;
                                var fill = custom.backgroundColor ? custom.backgroundColor :
                                    getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts
                                        .backgroundColor);
                                var stroke = custom.borderColor ? custom.borderColor :
                                    getValueAtIndexOrDefault(ds.borderColor, i, arcOpts
                                        .borderColor);
                                var bw = custom.borderWidth ? custom.borderWidth :
                                    getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts
                                        .borderWidth);

                                // We get the value of the current label
                                var value = chart.config.data.datasets[arc._datasetIndex]
                                    .data[arc._index];

                                return {
                                    // Instead of `text: label,`
                                    // We add the value to the string
                                    text: label + " : " + value + "%",
                                    fillStyle: fill,
                                    strokeStyle: stroke,
                                    lineWidth: bw,
                                    hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                    index: i
                                };
                            });
                        } else {
                            return [];
                        }
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        }
    });


});
</script>

<p>
<div style="text-align:left; width:100%; border:1px solid #ccc;padding:20px;">
    <span style="color: #999">This is a great domain!</span>
</div>
</p>

<div class="container">

    <div class="row align-center" style="margin-right: 0">
        <!-- <div class="columns mobile-50 phone-100"> -->
        <div style="width: 100%">
            <!-- <div style="width:50%;float:left;"> -->
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>DETAILS</strong></span>
                        </p>
                    </div>
                    <div style="padding-bottom:15px;font-size:14px">
                        <?php

                            if ($auction == 1) {
                                $offer = "AUCTION";
                                $price = "<strong>CURRENT BID: </strong>$".$askedprice."<br>";
                            } else {
                                $offer = "BIN";
                                $style = "style=\"color:#e1e1e1;\"";
                                $price = "<strong>ASKED PRICE: </strong>$".$askedprice."<br>";
                                $bids = "N/A";
                                $bidders = "N/A";
                                $end_time_stamp = "N/A";
                            }

                        ?>

                        <p>
                            <strong>VISITS:</strong> <?php echo traffic($traffic); ?><br>
                            <strong>OFFER:</strong> <?php echo $offer; ?><br>
                            <strong>LAST UPDATE:</strong> <?php echo $lastupdate; ?><br>
                            <?php echo $price; ?>
                        </p>
                        <p <?php echo $style; ?>>
                            <strong>BIDS:</strong> <?php echo $bids; ?><br>
                            <strong>BIDDERS:</strong> <?php echo $bidders; ?><br>
                            <strong>AUCTION ENDS:</strong> <?php echo $end_time_stamp; ?><br>
                        </p>
                    </div>
                    <div style="padding-top:15px;font-size:14px">
                        <p>
                            <strong>LEADS:</strong> <?php echo $leads; ?></br>
                            <strong>SOI:</strong> <?php echo $percentsoi; ?>%</br>
                            <strong>DOI:</strong> <?php echo $percentdoi; ?>%</br>
                        </p>
                    </div>

                    <br>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <!-- <div style="width:50%;float:right;"> -->

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>REFERRERS</strong></span>
                        </p>
                    </div>
                    <div style="padding:3px;">

                        <canvas id="refChart<?php echo $domid; ?>" ></canvas>
                    </div>
                    <!-- </div> -->
                </div>
            </div>


            <!-- </div> -->


            <div style="clear:all"></div>
            <p>
                <!-- <div style="width:50%;float:left;"> -->
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>COUNTRIES</strong></span>
                        </p>
                    </div>
                    <div style="padding:3px;">

                        <canvas id="geoChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>
                <!-- <div style="width:50%;float:right;"> -->
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>BROWSERS</strong></span>
                        </p>
                    </div>
                    <div style="padding:10px;">

                        <canvas id="browsersChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>
            </div>

            <div style="clear:all"></div>

            </p>

            <p>
                <!-- <div style="width:50%;float:left;"> -->
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>OPERATING SYSTEM</strong></span>
                        </p>
                    </div>
                    <div style="padding:10px;">

                        <canvas id="osChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>
                <!-- <div style="width:50%;float:right;"> -->
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>GENDER</strong></span>
                        </p>
                    </div>
                    <div style="padding:10px;">

                        <canvas id="genderChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>
            </div>
            <div style="clear:all"></div>
            </p>

            <p>
                <!-- <div style="width:50%;float:left;"> -->
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>AGE</strong></span>
                        </p>
                    </div>
                    <div style="padding:10px;">

                        <canvas id="ageChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>

                <!-- <div style="width:50%;float:right;"> -->
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">

                    <div class="wojo text content-center" style="padding-top:10px;">
                        <p>
                            <span style="font-size:14px"><strong>INTERESTS</strong></span>
                        </p>
                    </div>
                    <div style="padding:10px;">

                        <canvas id="interestChart<?php echo $domid; ?>"></canvas>
                    </div>
                </div>

            </div>
            <div style="clear:all"></div>
            </p>

        </div>
    </div>
</div>

<p>
<div class="row align-center" style="margin-top: 50px;">

    <?php
            if ($auction == 1) {
        ?>

    <a class="wojo labeled icon button"
        style="box-shadow: none; background-color: rgb(255, 153, 0); color: rgb(255, 255, 255);"
        href="<?php echo $reglink; ?>" rel="nofollow" target="_blank">
        <i class="icon check" style="color: rgb(255, 255, 255);"></i>
        PLACE BID
        <!--AT <?php echo $registrar; ?>-->
    </a>

    <?php
            }
            else {
        ?>

    <a class="wojo labeled icon button"
        style="box-shadow: none; background-color: rgb(17, 179, 35); color: rgb(255, 255, 255);"
        href="<?php echo $reglink; ?>" rel="nofollow" target="_blank">
        <i class="icon check" style="color: rgb(255, 255, 255);"></i>
        BUY THIS DOMAIN
        <!--AT AT <?php echo $registrar; ?>-->
    </a>

    <?php
            }
        ?>
</div>
</p>

<p>
<div style="text-align:center">
    Not convinced yet?<br><a href="https://www.domainsink.com/get-started/">Register</a>&nbsp;for free and see more
    details!
</div>
</p>