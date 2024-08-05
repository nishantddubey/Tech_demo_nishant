// pages/index.js

import { useState, useEffect } from 'react';
import TodaysDataTable from '../components/TodaysDataTable';
import axios from 'axios';

const Home = () => {
  const [todaysData, setTodaysData] = useState([]);

  useEffect(() => {
    async function getData() {
      try {
        const response = await axios.get('http://192.168.49.2:30001/api/todays-data/');
        setTodaysData(response.data);
      } catch (error) {
        console.error('Error fetching today\'s data:', error);
      }
    }

    getData();
  }, []);

  return (
    <div>
      <h1>Welcome to the Stock Monitoring System</h1>
      <h3>Here you can view the latest stock data and other related information.</h3>
      <TodaysDataTable data={todaysData} />
    </div>
  );
}

export default Home;
