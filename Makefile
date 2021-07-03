CC = gcc
CFLAGS = -Wall -g -Wpedantic
SRC = src
OBJ = obj
SRCS = $(wildcard $(SRC)/*.c)
OBJS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
BIN = bin
EXE = a.out

all: $(BIN) $(OBJ) $(EXE) 

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $< -o $(BIN)/$@

$(OBJ)/%.o: $(SRC)/%.c $(OBJ)/%.h
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ)/%.o: $(SRC)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@


# Creating missing directories
$(BIN): 
	mkdir $@

$(OBJ):
	mkdir $@

run: all
	./$(BIN)/$(EXE)

clean:
	$(RM) -r $(BIN)/* $(OBJ)/*