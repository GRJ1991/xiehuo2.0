@echo off
chcp 65001 >nul
echo ==========================================
echo    卸货管理软件 V2.0 - 网站打包工具
echo ==========================================
echo.

echo 正在创建部署文件夹...
if not exist "website-deploy" mkdir "website-deploy"

echo 正在复制 index.html...
copy /Y "index.html" "website-deploy\"

echo 正在创建说明文件...
(
echo # 卸货管理软件 V2.0 网站部署包
echo.
echo ## 部署说明
echo.
echo 1. 将 website-deploy 文件夹内的所有文件上传到您的网站空间
echo 2. 确保服务器已配置 HTTPS（否则导出图片功能可能受限）
echo 3. 直接访问 index.html 即可使用
echo.
echo ## 离线使用
echo.
echo 如果需要离线使用：
echo 1. 下载 html2canvas 库：https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js
echo 2. 将下载的文件重命名为 html2canvas.min.js
echo 3. 放在与 index.html 同一目录
echo 4. 编辑 index.html，将第387行的 CDN 链接改为本地引用
echo.
echo ## 手机访问
echo.
echo - 确保手机和电脑在同一网络下
echo - 如果部署在本地，使用电脑的局域网 IP 地址访问
echo - 示例：http://192.168.1.100/index.html
echo.
echo ## 快速启动（本地测试）
echo.
echo 使用 Python 启动：
echo   python -m http.server 8000
echo   然后访问 http://localhost:8000
echo.
echo 版本：V2.0
echo 更新日期：2026-05-05
) > "website-deploy\README.md"

echo.
echo ==========================================
echo    打包完成！
echo ==========================================
echo.
echo 部署文件夹：website-deploy\
echo.
echo 内含文件：
echo   - index.html （主程序）
echo   - README.md （部署说明）
echo.
echo 下一步：
echo   1. 上传 website-deploy 文件夹到您的网站空间
echo   2. 或直接双击 index.html 在浏览器中测试
echo.
pause