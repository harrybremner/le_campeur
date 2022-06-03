// const appendMessageToDom = (message) => {
//   const line = `<div class="row message unread">
//     <div class="col-3">${message.sender}</div>
//     <div class="col-9">${message.subject}</div>
//   </div>`;
//   document.getElementById('inbox').insertAdjacentHTML('afterbegin', line);
// };

console.log("hello")
const dateCalculator = () => {
  const startDate = document.getElementById("start_date").value
  const endDate = document.getElementById("end_date").value
  const numberOfDays = endDate - startDate
  const pricePerDay = document.querySelector(".daily_price").innerHTML
  console.log(numberOfDays * pricePerDay)
}

export default { dateCalculator }
