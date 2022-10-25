vek服务端自维护部署说明  
1-部署模板项目地址：https://codeberg.org/jacklee_cn/vekserver.git  
部署方案：  
1-git clone 部署模板项目  
2-项目对应文件说明  
mainSrcUrl.json 主服务器json文件，主要管理下面6个json的地址可以实现多文件异地部署  
--------------------------------------------
wineJsonSource.json 文件主要用于对wine后端仓库的管理里面包含wine的版本 wine的仓库 以及组建地址等  
appJsonSource.json 主要用于软件适配后自动配置Json脚本管理  
uplogs.json vek软件开发更新日志  
vekLogShow.json 操作特别说明日志  
vekUpdateInfo.json vek软件更新信息  
vekWinetricksServer.json winetricks上游服务器的也就是库的服务器地址  
-------------------------------------------- 
winetricks 文件是莫改版的vek修改需要谨慎  
package-vek.sh deepinwine打包专用脚本  

项目说明介绍：  

vek源码：https://codeberg.org/jacklee_cn/vekcode.git  
默认部署模板：https://codeberg.org/jacklee_cn/vekserver.git  
下载更新库：https://codeberg.org/jacklee_cn/vekup.git  
wineHQ后端库：https://codeberg.org/jacklee_cn/vekwinehqdev.git  
deepinwine5后端库：https://codeberg.org/jacklee_cn/vekdeepinwine.git  
deepinwine6后端库：https://codeberg.org/jacklee_cn/vekdeepinwine6.git  
lutris6后端库：https://codeberg.org/jacklee_cn/veklutris6.git  