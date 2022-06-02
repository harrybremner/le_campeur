import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="booking-calculator"
export default class extends Controller {
  static targets = ["startDate", "endDate", "totalPrice"]
  connect() {
    console.log("hello from booking calculator")
    // console.log(this.startDateTarget)
    // console.log(this.endDateTarget)
    // console.log(this.totalPriceTarget)
  }

  calculate(e) {
    e.preventDefault()
    console.log(e)
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)
    const totalDays = ((endDate - startDate)/(1000 * 60 * 60 * 24))
    const dailyPrice = Number.parseInt(this.element.dataset.price, 10)
    const totalPrice = totalDays * dailyPrice
    this.totalPriceTarget.innerText = totalPrice
  }
}
