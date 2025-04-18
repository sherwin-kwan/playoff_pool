function calculateEaster(year) {
  // Step 2: Calculate remainder A when year is divided by 19
  const A = year % 19;
  
  // Step 3: Calculate B
  let B = ((A * 11 + 5) % 30);
  if (B === 0) B = 1;
  
  // Step 4: Calculate full moon date by counting backwards from April 19
  const fullMoonDate = new Date(year, 3, 19 - B); // Month is 0-based in JS
  
  // Step 5: Get the day of week for the full moon (0 = Sunday, 6 = Saturday)
  const fullMoonDay = fullMoonDate.getDay();
  
  // Step 6: Calculate days until next Sunday
  let daysUntilSunday = (7 - fullMoonDay) % 7;
  if (daysUntilSunday === 0) {
    daysUntilSunday = 7;
  }
  
  // Calculate Easter by adding days until Sunday
  const easterDate = new Date(fullMoonDate);
  easterDate.setDate(easterDate.getDate() + daysUntilSunday); // Add 1 to not include C itself
  
  // Format the date as MM-DD
  const month = String(easterDate.getMonth() + 1).padStart(2, '0');
  const day = String(easterDate.getDate()).padStart(2, '0');
  
  return `${month}-${day}`;
}

for(let year = 2002; year <= 2030; year++) {
  console.log(year, calculateEaster(year))
}