pragma circom 2.0.0;

template NonEqual() {
    signal input in0;
    signal input in1;
    // to check that (in0-in1) is non-zero
    signal inverse;
    inverse <-- 1/(in0 - in1);
    inverse*(in0-in1) === 1;
}

// all elements are unique in the array (row)
template Distinct(n) {
    signal input in[n];
    component nonEqual[n][n];
    for (var i = 0; i < n; i++) {
        for (var j=0; j < i; j++) {
            nonEqual[i][j] = NonEqual();
            nonEqual[i][j].in0 <== in[i];
            nonEqual[i][j].in1 <== in[j];
        }
    }
}


// Enforce that 0 <= in < 16
template Bits4(){
    signal input in;
    signal bits[4];
    var bitsum = 0;
    for (var i = 0; i < 4; i++) {
        bits[i] <-- (in >> i) & 1;
        bits[i] * (bits[i] - 1) === 0;
        bitsum = bitsum + 2 ** i * bits[i];
    }
    bitsum === in;
}

template OneToNine() {
    signal input in;
    component lowerBound = Bits4();
    component upperBound = Bits4();
    // lowerBound is 1 (-1 so it is 0)
    lowerBound.in <== in-1;
    // upperBound is 9 (+6 so it is 15) 
    upperBound.in <== in+6;
}

template Sudoku(n) {
    // solution is a 2D array: indeces are (row_i, col_i)
    signal input solution[n][n];
    // puzzle is the same, but a zero indicates a blank
    signal input puzzle[n][n];

    // ensure that each solution # is in-range.
    component inRange[n][n];

    for (var i=0; i < n; i++){
        for (var j=0; j < n; j++){
            inRange[i][j] = OneToNine();
            inRange[i][j].in <== solution[i][j];
        }
    }

    // ensure that the puzzle and solution agree
    for (var i=0; i < n; i++){
        for (var j=0; j < n; j++){
            // puzzle cell * (puzzle - solution_cell) === 0
            puzzle[i][j] * (puzzle[i][j] - solution[i][j]) === 0;
        }
    }

    // ensure uniqueness in rows
    component distinctRow[n];
    for (var row=0; row < n; row++){
        distinctRow[row] = Distinct(n);
        for (var col=0; col < n; col++){
            distinctRow[row].in[col] <== solution[row][col];
        }
    }

    // ensure uniqueness in rows
    component distinctCol[n];
    for (var col=0; col < n; col++){
        distinctCol[col] = Distinct(n);
        for (var row=0; row < n; row++){
            distinctCol[col].in[row] <== solution[row][col];
        }
    }
}

component main {public[puzzle]} = Sudoku(9);

