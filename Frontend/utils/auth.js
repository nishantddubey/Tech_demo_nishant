export const isAuthenticated = () => {
    // Check if auth token is present in local storage
    return !!localStorage.getItem('authToken');
  };
  