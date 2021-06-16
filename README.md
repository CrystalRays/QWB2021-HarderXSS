# 强网杯2021 线上赛 WEB HarderXSS 赛题

> 没有修复bug，因此非预期什么的依旧能打通，各位愉快地调戏吧（逃）

## 题目信息
题目名称：		HarderXSS
题目描述：		小明在扫描某内网映射服务时发现有人映射了这么个站点在公网上，他发现可以进入对方的内网，你知道小明是怎么做的吗？

## 部署说明
构建命令：		cd docker && docker build -t xxe_xss:1.50 .
启动命令：		docker run -it -P -d --add-host=feedback.cubestone.com:127.0.0.1 --add-host=flaaaaaaaag.cubestone.com:127.0.0.1 --add-host=cubestone.com:127.0.0.1  xxe_xss:1.50 flag{demo}
动态flag：		用动态flag替换启动命令末尾的flag{demo}
注意事项：		docker中的80、443端口都要映射到公网，并提供给选手访问（已配置EXPOSE 80 443，启动命令中已使用-P参数自动映射）
