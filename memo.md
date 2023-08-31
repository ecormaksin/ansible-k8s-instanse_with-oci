# AnsibleでKubernetesクラスタを構築する手順のメモ

- Oracle Cloud Infrastrucure SDK for Python のインストール

  - Ubuntu上に構築するので、`Manual Installation` セクションの手順を実施する。
    - <https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/ansiblegetstarted.htm#prerequisites#ariaid-title4>

    - PyPiからインストールする。
      - <https://docs.oracle.com/ja-jp/iaas/Content/API/SDKDocs/pythonsdk.htm>

        ```shell
        pip install oci
        ```

    - 構成ファイルを作成する。
      - <https://docs.oracle.com/ja-jp/iaas/Content/API/Concepts/sdkconfig.htm>
      - デフォルトのファイル パスは `~/.oci/config` (Windowsの場合はPowershellから `mkdir %HOMEDRIVE%%HOMEPATH%\.oci` で作成)
        - 変更したい場合は、環境変数 `OCI_CONFIG_FILE` へ ファイル パスを指定する。
      - デフォルトのプロファイルは `DEFAULT`
        - 変更したい場合は、環境変数 `OCI_CONFIG_PROFILE` へ ファイル パスを指定する。

- OCI Ansible collection のインストール

  ```shell
  ansible-galaxy collection install oracle.oci
  ```

- Playbookの実行時に `oci python sdk required for this module.` でエラーになり、Ansible設定ファイルの `interpreter_python` へパスを指定する必要があった。(pyenvでPythonをインストールしたため？)

## Playbookの実行

```shell
# Syntax Check
ansible-playbook -vv --syntax-check -i ./inventory/<target_inventory_filename>.yml --extra-vars @vars_per_env.yml <target_playbook_filename>.yml

# Dry Run
ansible-playbook -vv --check -i ./inventory/<target_inventory_filename>.yml --extra-vars @vars_per_env.yml <target_playbook_filename>.yml

# Execute
ansible-playbook -vv -i ./inventory/<target_inventory_filename>.yml --extra-vars @vars_per_env.yml <target_playbook_filename>.yml
```

## その他記録用

- `oci_compute_global_image_capability_schema_facts` はイメージIDを取得するタスクではなかった。
