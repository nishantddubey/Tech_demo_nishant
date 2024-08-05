import React from 'react';

const TodaysDataTable = ({ data }) => {
  // Get the current day
  const today = new Date();

  // Calculate yesterday's date
  const yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);

  // Get the day name of yesterday
  const dayName = yesterday.toLocaleDateString('en-US', { weekday: 'long' });

  if (!data || data.length === 0) {
    // Show an alert if no data is available
    return <p>No data available.</p>;
  }

  return (
    <table>
      <thead>
        <tr>
          <th>Ticker</th>
          <th>Date</th>
          <th>Open</th>
          <th>High</th>
          <th>Low</th>
          <th>Close</th>
          <th>Volume</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item) => (
          <tr key={item.id}>
            <td>{item.ticker}</td>
            <td>{item.date}</td>
            <td>{item.open}</td>
            <td>{item.high}</td>
            <td>{item.low}</td>
            <td>{item.close}</td>
            <td>{item.volume}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default TodaysDataTable;
