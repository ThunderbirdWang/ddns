# ddns
DDNS更新脚本
操作系统openwrt
域名服务商DNSPod

## 替换wan接口
将源码中的pppoe-wan3替换为对应的wan接口名

获取域名和记录 ID

## 安装curl

给 OpenWrt 安装 cURL：



$ sudo opkg update

$ sudo opkg install curl





然后前往 DNSPod 的后台创建一个login_token，并通过 DNSPod 的 API 获取域名列表 和 记录列表 分别取得域名 ID（DOMAIN_ID）和记录 ID（RECORD_ID），记下这两个 ID，相关请求如下：



## 获取域名ID
curl -X POST https://dnsapi.cn/Domain.List -d 'login_token=LOGIN_TOKEN&format=json'
## 获取记录ID
curl -X POST https://dnsapi.cn/Record.List -d 'login_token=LOGIN_TOKEN&format=json&domain_id=DOMAIN_ID'





若提示类似下面的错误



curl: (77) Error reading ca cert path /etc/ssl/certs - PolarSSL: (-0x2900) X509 - Read/write of file failed





可以试着安装 ca-certificates 后重试
opkg install ca-certificates
