#!/bin/bash

# 你要更新的 container 名稱列表
containers=(grist slink pwpush stirling-pdf kutt kasm moviepilot-v2 snipe-it dockge speedtest-tracker watchtower guacamole_frontend guacamole_guacd_backend guacamole_guacenc openspeedtest)

# dockcheck.sh 的完整路徑
DOCKCHECK="/root/dockcheck/dockcheck.sh"

# 遍歷容器清單
for container in "${containers[@]}"; do
    echo "🔧 處理中：$container"
    
    # 執行 dockcheck 並等待結束
    $DOCKCHECK -l -s -i -f -y "$container"
    
    # 檢查執行結果
    if [ $? -eq 0 ]; then
        echo "✅ $container 處理完成"
    else
        echo "❌ $container 處理失敗，請檢查 log"
    fi

    echo "----------------------------------------"
    sleep 1  # 加個短暫等待避免太快（視情況可加）
done

echo "🎉 所有容器處理完畢！"
