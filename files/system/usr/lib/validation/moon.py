import os
from pathlib import Path

from tomllib import loads as tomloader

VAPOR_LIB = Path("/var/lib/vapor")
VAPOR_HOME = Path("/var/home")
VAPOR_TMPGLOB = Path("/tmp/vapor_temp_blob")

# escreve um blob randomico temporario em memoria direto
VAPOR_TMPGLOB.write_bytes(os.urandom(32 * 3))


def get_first_part():
    zero = VAPOR_TMPGLOB.read_bytes()[:32]
    return zero


def get_midle_part():
    pass


def get_last_part():
    pass


# apenas hex simples sem muito trabalho pra gerar hash
def get_clean_id(data: bytes):
    return bytearray(data).hex()


def initialized():
    state = VAPOR_LIB / "state"
    return state.exists() and state.is_file()


# checa se a home existe
def this_home_exists(string: str):
    home = VAPOR_HOME / string
    return home.exists() and home.is_dir()


# apenas um holder para função futura
def this_user_exists(string: str):
    return False


# o mesmo aqui
def this_group_exists(string: str):
    return False


def user_empty():
    # checa se não tem usuario
    return


def home_empty():
    # checa se /var/home está vazio
    return


def group_default():
    # checa se os grupos são os default
    # esses grupos ficarão atomicamente salvas em um arquivo default em usr/lib, com coisas bem default mesmo
    return


def init_state():

    if initialized():
        # verifica se os dados batem com o state
        state = VAPOR_LIB / "state"
        state_table = state.read_text("utf-8").splitlines()
        user_state = this_user_exists(state_table[0])
        group_state = this_group_exists(state_table[1])
        home_state = this_home_exists(state_table[2])
        return user_state and group_state and home_state
    else:
        # se ainda não fooi inicializado, verifica se é a primeira inicialização
        return home_empty() and user_empty() and group_default()


# eetcc..
#
