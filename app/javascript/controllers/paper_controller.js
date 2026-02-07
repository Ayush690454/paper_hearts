import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    x: Number,
    y: Number
  }

  connect() {
    this.applyPosition()
    this.dragging = false

    this.element.addEventListener("mousedown", this.startDrag)
    this.element.addEventListener("touchstart", this.startDrag, { passive: false })

    document.addEventListener("mousemove", this.drag)
    document.addEventListener("touchmove", this.drag, { passive: false })

    document.addEventListener("mouseup", this.stopDrag)
    document.addEventListener("touchend", this.stopDrag)
  }

  startDrag = (e) => {
    e.preventDefault()
    const point = e.touches ? e.touches[0] : e

    this.dragging = true
    this.offsetX = point.clientX - this.xValue
    this.offsetY = point.clientY - this.yValue
  }

  drag = (e) => {
    if (!this.dragging) return
    e.preventDefault()

    const point = e.touches ? e.touches[0] : e

    this.xValue = point.clientX - this.offsetX
    this.yValue = point.clientY - this.offsetY

    if (this.xValue < 0) this.xValue = 0
    if (this.yValue < 0) this.yValue = 0

    this.applyPosition()
  }

  stopDrag = () => {
    this.dragging = false
  }


  applyPosition() {
    this.element.style.left = `${this.xValue}px`
    this.element.style.top  = `${this.yValue}px`
  }
}
