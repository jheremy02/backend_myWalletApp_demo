 function getCurrentTime() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
  
    return `${hours}:${minutes}:${seconds}`;
  }

  function addDayToDate(inputDateString) {
    // Convert the input string to a Date object
    var dateObject = new Date(inputDateString);

    // Add one day to the date
    console.log(dateObject.getDate())
    dateObject.setDate(dateObject.getDate() + 1);

    // Extract the year, month, and day components
    var year = dateObject.getFullYear();
    var month = ('0' + (dateObject.getMonth() + 1)).slice(-2);  // Months are 0-indexed, so we add 1
    var day = ('0' + dateObject.getDate()).slice(-2);

    // Format the date in 'yyyy-MM-dd' format
    var formattedDate = year + '-' + month + '-' + day;
    
    return formattedDate;
}

function getCurrentDate() {
  var currentDate = new Date();

  // Extract the year, month, and day components
  var year = currentDate.getFullYear();
  var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);  // Months are 0-indexed, so we add 1
  var day = ('0' + currentDate.getDate()).slice(-2);

  // Format the current date in 'yyyy-MM-dd' format
  var formattedCurrentDate = year + '-' + month + '-' + day;

  return formattedCurrentDate;
}

function compareObjects(obj1, obj2) {
  // Get the keys of each object
  const keys1 = Object.keys(obj1);
  const keys2 = Object.keys(obj2);

  // If the number of keys is different, objects are not equal
  if (keys1.length !== keys2.length) {
      return false;
  }

  // Iterate through keys and compare values
  for (let key of keys1) {
      // If the value of any key is not equal, objects are not equal
      if (obj1[key] !== obj2[key]) {
          return false;
      }
  }

  // All attributes are equal
  return true;
}

function combineAndSortDates(array1, array2) {
  // Combine arrays and remove duplicates
  let combinedArray = Array.from(new Set([...array1, ...array2]));

  // Convert strings to Date objects for sorting
  let dateObjects = combinedArray.map(dateStr => new Date(dateStr));

  // Sort Date objects
  dateObjects.sort((a, b) => a - b);

  // Convert back to strings in 'yyyy-mm-dd' format
  let sortedDateStrings = dateObjects.map(date => date.toISOString().split('T')[0]);

  return sortedDateStrings;
}

function getFirstDayOfMonth() {
  var today = new Date();
  var firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
  return firstDay.toISOString().split('T')[0];
}

function getLastDayOfMonth() {
  var today = new Date();
  var firstDayOfNextMonth = new Date(today.getFullYear(), today.getMonth() + 1, 1);
  var lastDay = new Date(firstDayOfNextMonth - 1);
  return lastDay.toISOString().split('T')[0];
}

function getFirstAndLastDateLast30Days() {
  var endDate = new Date();
  var startDate = new Date();
  startDate.setDate(endDate.getDate() - 29);
  return [startDate.toISOString().split('T')[0], endDate.toISOString().split('T')[0]];
}

  module.exports={getCurrentTime,addDayToDate,getCurrentDate,compareObjects,combineAndSortDates,getFirstDayOfMonth,getLastDayOfMonth,getFirstAndLastDateLast30Days}