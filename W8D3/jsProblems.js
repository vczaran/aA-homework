function titleize(arr, callback) {
    idk :)
}


function Elephant(name, height, tricks) {
    this.name = name
    this.height = height
    this.tricks = [tricks]
}

Elephant.prototype.trumpet() {
    console.log(`${this.name} the elephant goes 'phrRRRRRR!!!!!`)
}

Elephant.prototype.grow() {
    this.height += 12
}

Elephant.prototype.addTrick(trick) {
    this.tricks.push(trick)
}