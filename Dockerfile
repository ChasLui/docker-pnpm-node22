# 第一阶段：基础构建环境
FROM node:22-bookworm-slim AS base
# 安装 git openssl 等基础依赖，并清理缓存
RUN apt-get update && \
    apt-get install -y curl build-essential openssl libssl3 pkg-config zip unzip libsqlite3-dev git ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装 yarn1 和其他全局包
RUN npm install -g node-gyp @electron/node-gyp
# 添加pnpm存储库并导入其GPG密钥
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -

# 更新包索引并安装pnpm
RUN apt update && apt install pnpm
