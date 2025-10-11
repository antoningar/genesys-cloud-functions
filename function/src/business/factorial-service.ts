export class FactorialService {
  async process(input: number): Promise<number> {
    if (isNaN(input) || input < 0) {
      throw new Error('Input must be a non-negative number');
    }
    return this.factorial(input);
  }

  private factorial(n: number): number {
    if (n === 0 || n === 1) {
      return 1;
    }
    return n * this.factorial(n - 1);
  }
}