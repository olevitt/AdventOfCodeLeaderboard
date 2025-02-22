<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>Calendrier de l'avent INSEE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

    <div class="container" style="margin-bottom: 5%">

        <div class="page-header">
            <h1 class="text-center">Calendrier de l'avent du code</h1>
        </div>
        <div id="media-div">
            <div>
                <a href="#"><i class="fab fa-rocketchat"></i></a>
            </div>
            <hr>
            <div>
                <a href="https://github.com/InseeFrLab/AdventOfCodeLeaderboard"><i class="fab fa-github"></i></a>
            </div>
        </div>

        <!-- Bootstrap FAQ - START -->
        <div class="container">
            <div class="alert alert-warning" role="alert">
                <h2 class="text-center" style="display: inline">Challenge INSEE ${year!'2018'}</h2>
                <table class="table" style="margin-top: 3em">
                    <tr><th></th><th>Joueur</th><th>Etoiles (énigmes résolues)</th><th>Score (rapidité)</th></tr>
                    <#list persons as user>
                        <tr>
                            <td>${user?index + 1}</td>
                            <td>
                                <#if user.link??>
                                    <a href="${user.link}">${user.username!"Anonyme"+user.id}</a>
                                <#else>
                                    <span>${user.username!"Anonyme"+user.id}</span>
                                </#if>
                                <#if user.language??>
                                    <span class="badge badge-pill badge-primary" style="background-color: black">${user.language}</span>
                                </#if>
                            </td>
                            <td>
                                <#list 1..25 as idx>
                                    <#if user.completionDayLevel.completionDayList[idx?c]??>
                                        <#if user.completionDayLevel.completionDayList[idx?c].dayChallengeList['2']??>
                                            <span class="fa-star fas" title="${idx} décembre
        Partie 1 résolue le ${dateService.formatDate(user.completionDayLevel.completionDayList[idx?c].dayChallengeList['1'].get_star_ts)}
        Partie 2 résolue le ${dateService.formatDate(user.completionDayLevel.completionDayList[idx?c].dayChallengeList['2'].get_star_ts)}"></span>
                                        <#elseif user.completionDayLevel.completionDayList[idx?c].dayChallengeList['1']??>
                                            <span class="fa-star-half-alt fas" title="${idx} décembre
        Partie 1 résolue le ${dateService.formatDate(user.completionDayLevel.completionDayList[idx?c].dayChallengeList['1'].get_star_ts)}"></span>
                                        <#else>
                                            <span class="fa-star far" title="${idx} décembre"></span>
                                        </#if>
                                    <#else>
                                        <span class="fa-star far" title="${idx} décembre"></span>
                                    </#if>
                                </#list>
                            </td>
                            <td><span>${user.score?c}</span></td>
                        </tr>
                    </#list>
                </table>
            </div>
            <#include "faq.ftl">
        </div>
        <!-- Bootstrap FAQ - END -->
    </div>

</body>
</html>
