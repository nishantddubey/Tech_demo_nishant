import React from 'react';

const TopGainersLosersTable = ({ data }) => {
  if (!data || data.length === 0) {
    return <p>No data available</p>;
  }

  const getRowStyle = (gainers_or_losers) => {
    return gainers_or_losers === 'Gainers' ? { color: 'green' } : { color: 'red' };
  };

  return (
    <table>
      <thead>
        <tr>
          <th>Ticker</th>
          <th>Date</th>
          <th>Gainers or Losers</th>
          <th>Percentage Change</th>
        </tr>
      </thead>
      <tbody>
        {data.map((entry) => (
          <tr key={`${entry.ticker}-${entry.date}-${entry.gainers_or_losers}`} style={getRowStyle(entry.gainers_or_losers)}>
            <td>{entry.ticker}</td>
            <td>{entry.date}</td>
            <td>{entry.gainers_or_losers}</td>
            <td>{entry.percentage_change}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default TopGainersLosersTable;
