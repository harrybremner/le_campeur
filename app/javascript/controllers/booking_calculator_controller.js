import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="booking-calculator"
export default class extends Controller {
  static targets = ["startDate", "endDate", "totalPrice", "startDateInput", "endDateInput", "numberOfDays"]
  connect() {
    console.log("hello from booking calculator")
    // console.log(this.startDateTarget)
    // console.log(this.endDateTarget)
    // console.log(this.totalPriceTarget)
  }

  calculate(e) {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    e.preventDefault()
    console.log(e)
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)
    const totalDays = ((endDate - startDate)/(1000 * 60 * 60 * 24))
    const dailyPrice = Number.parseInt(this.element.dataset.price, 10)
    const totalPrice = totalDays * dailyPrice
    totalPrice >= 0 ? (this.totalPriceTarget.innerText = totalPrice) : (this.totalPriceTarget.innerText = 0);
    this.startDateInputTarget.innerText = startDate.toLocaleDateString("en-US", options)
    this.endDateInputTarget.innerText = endDate.toLocaleDateString("en-US", options)
    this.numberOfDaysTarget.innerText = totalDays
  }
}
