function madLib(str1, str2, str3) {
    console.log(`We shall ${str1} the ${str2} ${str3}`)
}

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}

function fizzBuzz(array) {
    const newArr = [];

    array.forEach(el => {
        if ((el % 3 == 0) || (el % 5 == 0)) {
            newArr.push(el);
        }
    });

    return newArr;
}

function isPrime(num) {
    if (num<2) {return false;}

    for (let i=2; i<num; i++) {
        if (num % i == 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrimes(n) {
    let sum = 0;
    let count = 0;
    let i = 2;

    while (count < n) {
        if (isPrime(i)) {
            sum += i;
            count += 1;
        }
        i += 1;
    }
    return sum;
}