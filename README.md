# cbmysqlc1-cookbook

## Creates a 2-node MYSQL Cluster on Oracle Linux o/s 
## Node1 - mgmt, data
## Node2 - data, sql

## Supported Platforms - Linux, Windows with Vagrant, Berkshelf, Chef DK. Used Bill's Kitchen for development environment

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cbmysqlc1']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### cbmysqlc1::default

Include `cbmysqlc1` in your node's `run_list`:

```json
{
  "run_list": [
     'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::install_cluster_software]','recipe[cbmysqlc1::create_mysql_config_files]', 'recipe[cbmysqlc1::start_cluster_processes]'
  ]
}
```

## License and Authors

Author:: Gowrish Mallipattana
