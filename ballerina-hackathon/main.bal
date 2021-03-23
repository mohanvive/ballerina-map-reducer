import ballerina/io;
import ballerina/regex;

public function main() {

    string inputString = "For decades, programming languages have treated networks simply as I/O sources. Ballerina introduces fundamental, new abstractions of client objects, services, resource functions, and listeners to bring networking into the language so that programmers can directly address the Fallacies of Distributed Computing as part of their application logic. This facilitates resilient, secure, performant network applications to be within every programmer’s reach.";
    string[] words = regex:split(inputString, " ");

    map<int> intermediateMap = {};

    int[] testOutput = words.'map(function (string value) returns int {
        if(intermediateMap.hasKey(value)) {
            int? existingValue = intermediateMap[value];
            if (existingValue is ()) {
                panic error("Returned value should be an string.");
            } else {
                intermediateMap[value] = existingValue + 1;
            }
        } else {
            intermediateMap[value] = 1;
        }
        return 1;
    });

    int finalValue = intermediateMap.reduce(function (int accum, int count) returns  int {
        return accum + count;
    }, 0);


    io:println(intermediateMap);
    io:println(finalValue);
}