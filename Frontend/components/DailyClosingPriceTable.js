import React, { useState } from 'react';

const DailyClosingPricesTable = ({ data }) => {
  const [searchQuery, setSearchQuery] = useState('');

  const filteredData = React.useMemo(() => {
    if (!data) return [];

    return data.filter((item) =>
      item.ticker.toLowerCase().includes(searchQuery.toLowerCase()) ||
      item.date.toLowerCase().includes(searchQuery.toLowerCase()) ||
      item.close.toString().includes(searchQuery)
    );
  }, [data, searchQuery]);

  if (!data || data.length === 0) {
    return <p>No data available</p>;
  }

  return (
    <div>
      <input
        type="text"
        placeholder="Search..."
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        style={{ marginBottom: '10px' }}
      />
      <table>
        <thead>
          <tr>
            <th>Ticker</th>
            <th>Date</th>
            <th>Closing Price</th>
          </tr>
        </thead>
        <tbody>
          {filteredData.map((item) => (
            <tr key={item.id}>
              <td>{item.ticker}</td>
              <td>{item.date}</td>
              <td>{item.close}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default DailyClosingPricesTable;
