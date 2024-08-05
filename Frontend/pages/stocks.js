// pages/stocks.js

import { useState, useEffect } from 'react';
import StockTable from '../components/StockTable';
import axios from 'axios';

export default function Stocks() {
  const [stockData, setStockData] = useState([]);

  useEffect(() => {
    async function getData() {
      try {
        const response = await axios.get('http://192.168.49.2:30001/api/stock-data/');
        setStockData(response.data);
      } catch (error) {
        console.error('Error fetching stock data:', error);
      }
    }

    getData();
  }, []);

  return (
    <div>
      <h1>Stock Data</h1>
      <h3>All historical stock data</h3>
      <StockTable data={stockData} />
    </div>
  );
}
