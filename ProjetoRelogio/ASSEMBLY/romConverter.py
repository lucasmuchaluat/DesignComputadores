def main():
    linhas = []
    with open("testInstructions.txt", "r") as f:
        linhas = f.read().splitlines()

    with open("./rom.vhd", "w") as f:
        for i in range(len(linhas)):
            f.write(f'tmp({i}):= b"{linhas[i]}";\n')

main()