import { Given, When, Then } from '@cucumber/cucumber';
import { strict as assert } from 'assert';
import { FactorialService } from '../../src/business/factorial-service';

let result: number;
let service: FactorialService;

Given('a business service that calculates the factorial of a number', function () {
  service = new FactorialService();
});

When('the number is {int}', async function (num: number) {
  result = await service.process(num);
});

Then('it should return {int}', function (expected: number) {
  assert.equal(result, expected);
});
