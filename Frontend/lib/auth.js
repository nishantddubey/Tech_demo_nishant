// lib/auth.js

export const isAuthenticated = () => {
    // Check for token or other auth indicators
    return !!localStorage.getItem('authToken'); // Adjust based on your auth logic
  };


//   This is working data