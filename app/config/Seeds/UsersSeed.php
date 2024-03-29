<?php
use Migrations\AbstractSeed;

/**
 * Users seed.
 */
class UsersSeed extends AbstractSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeds is available here:
     * http://docs.phinx.org/en/latest/seeding.html
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'name' => 'Alice',
                'address' => '123 Main St',
            ],
            [
                'name' => 'Bob',
                'address' => '456 Elm St',
            ],
        ];

        $table = $this->table('users');
        $table->insert($data)->save();
    }
}
