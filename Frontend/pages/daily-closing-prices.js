// pages/daily-closing-prices.js
import { useState, useEffect } from 'react';
import DailyClosingPricesTable from '../components/DailyClosingPriceTable';
import axios from 'axios';

const DailyClosingPrices = () => {
  const [dailyClosingPriceData, setDailyClosingPriceData] = useState([]);

  useEffect(() => {
    async function getData() {
      try {
        const response = await axios.get('http://192.168.49.2:30001/api/daily-closing-price/');
        setDailyClosingPriceData(response.data);
      } catch (error) {
        console.error('Error fetching daily closing price data:', error);
      }
    }

    getData();
  }, []);

  return (
    <div>
      <h1>Daily Closing Prices</h1>
      <h3>The final price at which a stock is traded at the end of the day.</h3>
      <DailyClosingPricesTable data={dailyClosingPriceData} />
    </div>
  );
}

export default DailyClosingPrices;
