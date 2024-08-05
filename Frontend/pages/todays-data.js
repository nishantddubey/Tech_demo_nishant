// pages/todays-data.js

import { useState, useEffect } from 'react';
import TodaysDataTable from '../components/TodaysDataTable';
import axios from 'axios';

const TodaysData = () => {
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
      <h1>Latest Data</h1>
      <TodaysDataTable data={todaysData} />
    </div>
  );
}

export default TodaysData;
