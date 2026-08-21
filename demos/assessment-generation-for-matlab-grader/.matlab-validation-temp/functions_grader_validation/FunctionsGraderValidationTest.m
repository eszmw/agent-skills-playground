classdef FunctionsGraderValidationTest < matlab.unittest.TestCase
    %FunctionsGraderValidationTest Validates Functions lesson Grader references.

    properties (Constant)
        CourseRoot = "C:\Users\esmithzb\Repositories\CodexWork\SkillsTesting\agent-skills-playground\demos\assessment-generation-for-matlab-grader\Programming-Structuring-Code\Functions"
    end

    methods (TestClassSetup)
        function addItemFoldersToPath(testCase)
            addpath(fullfile(testCase.CourseRoot, "greet_user"));
            addpath(fullfile(testCase.CourseRoot, "mark_midpoint"));
            addpath(fullfile(testCase.CourseRoot, "apply_operation"));
            addpath(fullfile(testCase.CourseRoot, "solve_with_fzero"));
            testCase.addTeardown(@() rmpath( ...
                fullfile(testCase.CourseRoot, "greet_user"), ...
                fullfile(testCase.CourseRoot, "mark_midpoint"), ...
                fullfile(testCase.CourseRoot, "apply_operation"), ...
                fullfile(testCase.CourseRoot, "solve_with_fzero")));
        end
    end

    methods (Test)
        function testCalculatorReferenceAndCompletedTemplate(testCase)
            results = testCase.runCalculatorSolution;

            testCase.verifyEqual(results.powerValues, [2 4 8 16 32]);
            testCase.verifyEqual(results.imaginaryRoot, 3i);
            testCase.verifyEqual(results.eValue, exp(1), AbsTol=1e-12);
            testCase.verifyEqual(results.radianCosine, 0, AbsTol=1e-12);
            testCase.verifyEqual(results.degreeCosine, sqrt(3)/2, AbsTol=1e-12);
        end

        function testCalculatorDegreeMutantFails(testCase)
            degreeMutant = cos(30);

            testCase.verifyNotEqual(degreeMutant, sqrt(3)/2);
        end

        function testDocumentedOptionReferenceAndCompletedTemplate(testCase)
            results = testCase.runIntegralSolution;

            testCase.verifyEqual(results.integralEstimate, pi/2, AbsTol=1e-12);
        end

        function testGreetingReferenceAndCompletedTemplate(testCase)
            studentDisplay = string(evalc('greeting = greetUser("Ava");'));

            testCase.verifyEqual(greeting, "Hello, Ava!");
            testCase.verifyTrue(contains(studentDisplay, greeting));
        end

        function testGreetingNoDisplayMutantFails(testCase)
            mutantDisplay = "";
            expectedGreeting = "Hello, Ava!";

            testCase.verifyFalse(contains(mutantDisplay, expectedGreeting));
        end

        function testMidpointReferenceAndCompletedTemplate(testCase)
            figureHandle = figure(Visible="off");
            testCase.addTeardown(@() close(figureHandle));

            midpoint = markMidpoint([2 -1], [6 7]);
            markerLines = findall(gca, Type="line", Marker="o");

            testCase.verifyEqual(midpoint, [4 3]);
            testCase.verifyNotEmpty(markerLines);
            testCase.verifyEqual(markerLines(1).MarkerFaceColor, [1 1 0]);
        end

        function testMidpointUnfilledMutantFails(testCase)
            mutantMarkerFaceColor = "none";

            testCase.verifyNotEqual(mutantMarkerFaceColor, "y");
        end

        function testApplyOperationReferenceAndCompletedTemplate(testCase)
            transformedValues = applyOperation(@(x) 2*x + 1, [-2 0 3]);

            testCase.verifyEqual(transformedValues, [-3 1 7]);
        end

        function testApplyOperationHardcodedMutantFails(testCase)
            values = [-2 0 3];
            correctResult = 2*values + 1;
            hardcodedSquareMutant = values.^2;

            testCase.verifyNotEqual(hardcodedSquareMutant, correctResult);
        end

        function testFzeroReferenceAndCompletedTemplate(testCase)
            root = solveWithFzero(@(x) cos(x) - x*exp(-sin(x)), 0.5);

            testCase.verifyEqual(root, 1.102205177436505, AbsTol=1e-10);
        end

        function testFzeroHardcodedMutantFails(testCase)
            functionHandle = @(x) x - 2;
            root = fzero(functionHandle, 1);
            hardcodedRootMutant = 1.102205177436505;

            testCase.verifyNotEqual(hardcodedRootMutant, root);
        end
    end

    methods (Access = private)
        function results = runCalculatorSolution(testCase)
            run(fullfile(testCase.CourseRoot, ...
                "compute_calculator_expressions", "solution.m"));
            results = struct( ...
                "powerValues", powerValues, ...
                "imaginaryRoot", imaginaryRoot, ...
                "eValue", eValue, ...
                "radianCosine", radianCosine, ...
                "degreeCosine", degreeCosine);
        end

        function results = runIntegralSolution(testCase)
            run(fullfile(testCase.CourseRoot, ...
                "integrate_with_documented_option", "solution.m"));
            results = struct("integralEstimate", integralEstimate);
        end
    end
end
