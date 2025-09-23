#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2024, Tiny Tapeout LTD
# Author: Uri Shaked

import json
import logging
import os
import git

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.path.pardir))


def clone_source_repos():
    shuttle_index = json.load(open("shuttle_index.json"))
    for number, project in enumerate(shuttle_index["projects"]):
        repo = project["repo"]
        commit = project["commit"]
        macro = project["macro"]
        repo_dir = os.path.join(ROOT, macro)

        if macro == "tt_um_chip_rom":
            logging.info(f"[{number :03}] skipping chip ROM")
            continue

        if not os.path.exists(repo_dir):
            logging.info(f"cloning {number :03} {repo}")
            git.Repo.clone_from(repo, repo_dir)
            cloned_repo = git.Repo(repo_dir)
            cloned_repo.git.submodule("update", "--init")
            cloned_repo.git.checkout(commit)
        else:
            cloned_repo = git.Repo(repo_dir)
            if commit != cloned_repo.commit().hexsha:
                logging.info(f"updating {number :03} {repo} to commit {commit}")
                cloned_repo.git.fetch("origin")
                cloned_repo.git.checkout(commit)
                cloned_repo.git.submodule("update", "--init")


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    clone_source_repos()
