function calculate_h_value(row, col, dest){
    return power(power((row - dest[0]),2) + power((col - dest[1]),2),0.5)
}
