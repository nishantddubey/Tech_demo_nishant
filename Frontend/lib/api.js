// lib/api.js

const BASE_URL = 'http://192.168.49.2:30001/api'; // Use Kubernetes service name

export const fetchStockData = async () => {
    const response = await axios.get(`${BASE_URL}/stock-data/`);
    return response.data;
};

export const fetchDailyClosingPrice = async () => {
    const response = await axios.get(`${BASE_URL}/daily-closing-price/`);
    return response.data;
};

export const fetchPriceChangePercentage = async () => {
    const response = await axios.get(`${BASE_URL}/price-change-percentage/`);
    return response.data;
};

export const fetchTopGainersLosers = async () => {
    const response = await axios.get(`${BASE_URL}/top-gainers-losers/`);
    return response.data;
};

export const fetchTodaysData = async () => {
    const response = await axios.get(`${BASE_URL}/todays-data/`);
    return response.data;
};

// Your other API functions
