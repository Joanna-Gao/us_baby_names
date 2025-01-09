import pandas as pd
import argparse
import os


def get_args():
    parser = argparse.ArgumentParser(
        description="Combine CSV files into a single output.")
    parser.add_argument('path_to_files', type=str,
                        help="Directory containing the CSV files.")
    parser.add_argument('output_name', type=str,
                        help="Name of the output CSV file.")
    args = parser.parse_args()
    return args


def main(input_path, output_path):
    """
    Clean and combine us baby names data.
    """
    df_list = []
    for file_name in os.listdir(input_path):
        file_path = os.path.join(input_path, file_name)
        df_list.append(pd.read_csv(file_path, header=None))

    combined_df = pd.concat(df_list, ignore_index=True)
    combined_df.to_csv(output_path, index=False)


if __name__ == '__main__':
    config = get_args()
    input_path = os.path.abspath(config.path_to_files)

    # Correctly handling the creation of the output path
    output_path = os.path.join(os.path.dirname(input_path), config.output_name)

    main(input_path, output_path)
