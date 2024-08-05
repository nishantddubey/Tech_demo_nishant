// next.config.js
module.exports = {
    async rewrites() {
        return [
            {
                source: '/api/:path*',
                destination: 'http://192.168.49.2:30001/api/:path*' // Proxy to Backend
            }
        ];
    }
};
