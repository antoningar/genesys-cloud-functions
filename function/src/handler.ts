import { FactorialService } from './business/factorial-service';

export interface Event {
  input: number;
}

export const handler = async (
  event: Event
) => {
  try {
    console.log('Event:', JSON.stringify(event, null, 2));

    const exampleService = new FactorialService();
    const result = await exampleService.process(event.input);
    
    return {
      statusCode: 200,
      headers: {
        'Content-Type': 'application/json',
      },
      body: result,
    };
  } catch (error) {
    console.error('Error:', error);
    
    return {
      statusCode: 500,
      headers: {
        'Content-Type': 'application/json',
      },
      body: error instanceof Error ? error.message : 'Unknown error',
    };
  }
};

// CLI runner
if (require.main === module) {
  const fakeEvent: Event = {
    input: +process.argv[2] || 5,
  };

  handler(fakeEvent)
    .then(result => {
      console.log('Result:', JSON.stringify(result, null, 2));
    })
    .catch(error => {
      console.error('Error:', error);
      process.exit(1);
    });
}