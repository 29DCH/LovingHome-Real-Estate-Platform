<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导出报表</title>
    <style>
        section, section div {
            transition-duration: .6s;
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-image: -webkit-radial-gradient(center top, circle farthest-corner, #FFFFFF 0%, #D8DFE9 100%);
            background-image: radial-gradient(circle farthest-corner at center top, #FFFFFF 0%, #D8DFE9 100%);
            overflow: hidden;
        }

        section, .button {
            transition-timing-function: ease;
        }

        section {
            display: inline-block;
            position: relative;
            padding: .375rem .375rem 0;
            height: 2.5rem;
            background: #A9ADB6;
            border-radius: .25rem;
            perspective: 300;
            box-shadow: 0 -1px 2px #fff, inset 0 1px 2px rgba(0, 0, 0, .2), inset 0 .25rem 1rem rgba(0, 0, 0, .1);
        }

        .button {
            opacity: 0;
        }

        .cover {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            transform-origin: center bottom;
            transform-style: preserve-3d;
            font: 1.25em/2 "icon";
            color: white;
            text-align: center;
            pointer-events: none;
            z-index: 100;
        }

        .innie, .outie, .spine, .shadow {
            position: absolute;
            width: 100%;
        }

        .innie, .outie {
            height: 100%;
            background-image: -webkit-linear-gradient(top, transparent 0%, rgba(0, 0, 0, .1) 100%);
            border-radius: .25rem;
        }

        svg {
            width: 40px;
            height: 40px;
            filter: drop-shadow(0 1px 2px rgba(0, 0, 0, .25))
        }

        .innie {
            background-color: #67E2FE;
            text-shadow: 0 -2px 4px rgba(0, 0, 0, .2);
        }

        .spine {
            top: .25rem;
            background: #20C7F3;
            height: .25rem;
            transform: rotateX(90deg);
            transform-origin: center top;
        }

        .shadow {
            top: 100%;
            left: 0;
            height: 3.5rem;
            transform-origin: center top;
            transform: rotateX(90deg);
            opacity: 0;
            z-index: 0;
            background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, .6) 0%, transparent 100%);
            background-image: linear-gradient(to bottom, rgba(0, 0, 0, .6) 0%, transparent 100%);
            border-radius: .4rem;

        }

        .outie {
            background-color: #2EC8FA;
            transform: translateZ(.25rem);
            text-shadow: 0 2px 4px rgba(0, 0, 0, .2);
        }

        section:hover {
            background: #EBEFF2;
        }

        section:hover .button {
            opacity: 1;
        }

        section:hover .cover, section:hover .innie, section:hover .spine, section:hover .outie, section:hover .spine {
            transition-timing-function: cubic-bezier(.2, .7, .1, 1.1);
        }

        section:hover .cover {
            transform: rotateX(-120deg);
        }

        section:hover .innie {
            background-color: #3ADAFC;
        }

        section:hover .spine {
            background-color: #52B1E0;
        }

        section:hover .outie {
            background-color: #2174A0;
            color: rgba(255, 255, 255, 0);
        }

        section:hover .shadow {
            opacity: 1;
            transform: rotateX(45deg) scale(.95);
        }

    </style>
</head>
<body>
<div style="margin-left:60px;margin-top:-80px">
    <form class="form-horizontal" id="form_table" action="/importHouseinfo" enctype="multipart/form-data" method="post">
        <input class="form-input" type="file" name="filename">
        <br/>
        <button type="submit" class="btn">开始导入</button>
    </form>
</div>
<section style="margin-left:-610px;margin-top:-60px">
    <div class="button">
        <a href="/exportUserinfo" class="twitter-follow-button" data-show-count="false" data-size="large"
           style="text-decoration: none;color:deepskyblue">导出用户信息</a>
       <@admin_common.style/>
</section>
<section style="margin-left:400px;margin-top:-60px">
    <div class="button">
        <a href="/exportHouseinfo" class="twitter-follow-button" data-show-count="false" data-size="large"
           style="text-decoration: none;color:red">导出房源信息</a>
      <@admin_common.style/>
</section>
</body>
</html>