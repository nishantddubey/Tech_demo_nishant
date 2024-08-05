import { useState } from 'react';

const StockTable = ({ data }) => {
  const [sortConfig, setSortConfig] = useState({ key: 'ticker', direction: 'ascending' });
  const [searchTerm, setSearchTerm] = useState('');

  const getSortFunction = (key) => {
    switch (key) {
      case 'date':
        return (a, b) => new Date(a[key]) - new Date(b[key]);
      case 'ticker':
        return (a, b) => a[key].localeCompare(b[key]);
      case 'open':
      case 'high':
      case 'low':
      case 'close':
      case 'volume':
        return (a, b) => a[key] - b[key];
      default:
        return (a, b) => a[key].localeCompare(b[key]);
    }
  };

  const sortedData = [...data].sort((a, b) => {
    const sortFunction = getSortFunction(sortConfig.key);
    const comparison = sortFunction(a, b);
    return sortConfig.direction === 'ascending' ? comparison : -comparison;
  });

  const filteredData = sortedData.filter((item) =>
    item.ticker.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  return (
    <div>
      <input
        type="text"
        placeholder="Search by ticker..."
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
      />
      <table>
        <thead>
          <tr>
            <th onClick={() => handleSort('ticker')}>
              Ticker {sortConfig.key === 'ticker' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('date')}>
              Date {sortConfig.key === 'date' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('open')}>
              Open {sortConfig.key === 'open' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('high')}>
              High {sortConfig.key === 'high' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('low')}>
              Low {sortConfig.key === 'low' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('close')}>
              Close {sortConfig.key === 'close' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
            <th onClick={() => handleSort('volume')}>
              Volume {sortConfig.key === 'volume' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : ''}
            </th>
          </tr>
        </thead>
        <tbody>
          {filteredData.map((item) => (
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
    </div>
  );
};

export default StockTable;
