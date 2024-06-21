
// -- Imports --
import $ from 'jquery';
import Papa from 'papaparse';

// -- Variables --
export { $, Papa };

// This function reads a CSV file and logs the parsed data to the console
function readCSV(file) {
    const reader = new FileReader();

    reader.onload = function (e) {
        const csvData = e.target.result;
        Papa.parse(csvData, {
            header: true,
            complete: function (results) {
                console.log(results.data);
            }
        });
    };

    reader.readAsText(file);
}
