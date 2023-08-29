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
      - デフォルトのプロファイルは `DEFAULT`

- OCI Ansible collection のインストール

  ```shell
  ansible-galaxy collection install oracle.oci
  ```

- Playbookの実行時に `oci python sdk required for this module.` でエラーになり、Ansible設定ファイルの `interpreter_python` へパスを指定する必要があった。(pyenvでPythonをインストールしたため？)
