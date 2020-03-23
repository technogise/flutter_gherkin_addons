var reporter = require('cucumber-html-reporter');

var options = {
        theme: 'bootstrap',
        jsonFile: (process.env.FLUTTER_TEST_OUTPUTS_DIR?process.env.FLUTTER_TEST_OUTPUTS_DIR:'build')+'/report.json',
        output: 'out/test/report/report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        metadata: {
        }
    };

    reporter.generate(options);