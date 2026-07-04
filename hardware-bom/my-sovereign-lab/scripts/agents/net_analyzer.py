import subprocess
import logging
import time
from datetime import datetime

logging.basicConfig(level=logging.INFO, filename='net_analyzer.log')

def run_recon():
    logging.info(f'{datetime.now()} - Agent Net-Analyzer: Starting Recon...')
    result = subprocess.run(['nmap', '-sn', '10.42.0.0/24'], capture_output=True, text=True)
    logging.info(f'Scan results: {result.stdout}')

if __name__ == '__main__':
    while True:
        run_recon()
        time.sleep(3600)
