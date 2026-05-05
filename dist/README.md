# 卸货管理软件 V2.0 - 网站部署指南

## 📦 部署方式

### 方式一：静态服务器部署（推荐）

1. 将整个 `dist` 文件夹上传到您的服务器
2. 确保服务器已配置好 HTTPS（否则导出图片功能可能受限）
3. 访问 `index.html` 即可

### 方式二：放到现有网站目录

1. 将 `index.html` 文件放到您的网站目录
2. 确保有网络连接（用于加载 html2canvas 库）

### 方式三：离线使用

如果需要离线使用：
1. 下载 html2canvas 库：https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js
2. 将下载的文件重命名为 `html2canvas.min.js`
3. 放在与 `index.html` 同一目录
4. 编辑 `index.html`，将第387行的：
   ```html
   <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
   ```
   改为：
   ```html
   <script src="html2canvas.min.js"></script>
   ```

---

## 🔧 服务器配置

### Nginx 配置示例

```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        root /path/to/dist;
        index index.html;
        try_files $uri $uri/ /index.html;
    }
    
    # 启用 Gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript;
}
```

### Apache 配置示例

在 `.htaccess` 中添加：

```apache
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.html [QSA,L]
```

---

## 📱 手机访问

- 确保手机和电脑在同一网络下
- 如果部署在本地，使用电脑的局域网 IP 地址访问
- 示例：`http://192.168.1.100/index.html`

---

## ⚠️ 注意事项

1. **数据存储**：默认使用浏览器 localStorage 存储数据
2. **数据同步**：如需多设备数据同步，需要后端服务器支持
3. **HTTPS**：导出图片功能在 HTTPS 下更稳定
4. **浏览器兼容性**：建议使用 Chrome、Safari、Edge 等现代浏览器

---

## 🚀 快速开始

1. 直接双击 `index.html` 在浏览器中打开
2. 或使用 Python 启动本地服务器：
   ```bash
   python -m http.server 8000
   ```
   然后访问 `http://localhost:8000`

---

## 📋 文件清单

- `index.html` - 主程序文件（包含 HTML、CSS、JavaScript）
- `html2canvas.min.js` - 图片导出库（如使用本地文件）
- `README.md` - 部署说明文件

---

版本：V2.0
更新日期：2026-05-05