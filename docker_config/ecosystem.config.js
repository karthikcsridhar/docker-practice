module.exports = {
    apps: [
        {
            name: "docker-practice-nodeapp-test",
            script: "./bin/www",
            instances: 1,
            exec_mode: "cluster",
            env: {
                "NODE_ENV": "development",
                "PORT": "3000"
            }
        }
    ]
}