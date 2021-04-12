#!/bin/bash
#edit:JackLee 2021-4-6
#Add args


set_deb_option()
{
   case "$1" in
        #应用描述
        --d=*)    vek_app_description="${!##--d=}" ;;
        #应用程序英文名
        --a=*)    vek_app_name="${!##--a=}" ;;
        #应用程序中文名
        --c=*)    vek_app_name_zh_cn="${!##--c=}" ;;
        #部署时容器名
        --p=*)    vek_public_bottle_name="${!##--p=}" ;;
        #文件分类
        --dfc=*)  vek_desktop_file_categories="${!##--dfc=}" ;;
        #软件ico
        --dfi=*)  vek_desktop_file_icon="${!##--dfi=}" ;;
        #主程序名
        --dfme=*) vek_desktop_file_main_exe="${!##--dfme=}" ;;
        #主程序路径
        --ep=*)   vek_exec_path="${!##--ep=}" ;;
        #最终生成包名
        --dpn=*)  vek_deb_package_name="${!##--dpn=}" ;;
        #专业版包名
        --edp=*)  vek_elephant_deb_package_name="${!##--edp=}" ;;       
        #最终生成包版本号
        --dvs=*)  vek_deb_version_string="${!##--dvs=}" ;;
        #之前老的包名，安装新的包自动卸载老的包
        --opn=*)  vek_old_package_name="${!##--opn=}" ;;
        *) return 1;;
    esac
    return 0
}


while set_deb_option "$1"; do
        shift
    done
#最终生成的包的描述
export app_description=$vek_app_description
#应用程序英文名
export app_name=$vek_app_name
#应用程序中文名
export app_name_zh_cn=$vek_app_name_zh_cn
#要打包的原始容器名（目前假定容器一定存放于当前用户目录下)
#export origin_bottle_name=".WeChat"
#部署时在用户机器上的容器名（部署后位于~/.deepinwine/容器名)
export public_bottle_name=$vek_public_bottle_name
#desktop文件中的分类
export desktop_file_categories=$vek_desktop_file_categories
#desktop文件中的图标名,与包名匹配
export desktop_file_icon=$vek_desktop_file_icon
#desktop文件中StartupWMClass字段。用于让桌面组件将窗口类名与desktop文件相对应。这个值为实际运行的主程序EXE的文件名，wine/crossover在程序运行后会将文件名设置为窗口类名
export desktop_file_main_exe=$vek_desktop_file_main_exe
export exec_path=$vek_exec_path
#最终生成的包的包名,包名的命名规则以deepin开头，加官网域名（需要前后对调位置），如还不能区分再加上应用名
export deb_package_name=$vek_deb_package_name
#专业版的包名
export elephant_deb_package_name=$vek_elephant_deb_package_name
#最终生成的包的版本号，版本号命名规则：应用版本号+deepin+数字
export deb_version_string=$vek_deb_version_string
#之前老的包名，安装新的包自动卸载老的包
export old_package_name=$vek_old_package_name

wine_depends="libasound2 (>= 1.0.16), libc6 (>= 2.28), libglib2.0-0 (>= 2.12.0), libgphoto2-6 (>= 2.5.10), libgphoto2-port12 (>= 2.5.10), libgstreamer-plugins-base1.0-0 (>= 1.0.0), libgstreamer1.0-0 (>= 1.4.0), liblcms2-2 (>= 2.2+git20110628), libldap-2.4-2 (>= 2.4.7), libmpg123-0 (>= 1.13.7), libopenal1 (>= 1.14),
libpcap0.8 (>= 0.9.8), libpulse0 (>= 0.99.1), libudev1 (>= 183), libvkd3d1 (>= 1.0), libx11-6, libxext6, libxml2 (>= 2.9.0),
ocl-icd-libopencl1 | libopencl1, udis86, zlib1g (>= 1:1.1.4), libasound2-plugins, libncurses6 | libncurses5 | libncurses"

export package_depends="$wine_depends, deepin-wine-plugin-virtual"

export apprun_cmd='$HOME/.deepinwine/deepin-wine5-stable/bin/wine'
export SPECIFY_SHELL_PATH='$HOME/.deepinwine/deepin-wine-helper/run_v3.sh'

export patch_loader="LD_PRELOAD=/opt/apps/$deb_package_name/files/libloader.so"

./script-packager.sh $@
