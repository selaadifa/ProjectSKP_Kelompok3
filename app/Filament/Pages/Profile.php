<?php

namespace App\Filament\Pages;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Pages\Page;
use App\Models\User;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\BelongsToSelect;


class Profile extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-user';
    protected static ?string $navigationGroup = 'Main Menu';
    protected static ?int $navigationSort = 1;
    protected static string $view = 'filament.pages.profile';
    protected static bool $shouldRegisterNavigation = false;

    public $nama;
    public $nip;
    public $pangkat;
    public $jabatan_id;
    public $unit_kerja;

    public function mount()
    {
        $record = auth()->user();
        $this->form->fill($record->toArray());
    }

    protected function getFormSchema(): array
    {
        return [
            Grid::make()
                ->columns(2)
                ->schema([
                    TextInput::make('name')
                        ->label('Nama')
                        ->required(),
                    TextInput::make('nip')
                        ->label('NIP')
                        ->required(),
                    TextInput::make('pangkat')
                        ->label('PANGKAT/GOLONGAN RUANG')
                        ->required(),
                    TextInput::make('unit_kerja')
                        ->label('Unit Kerja')
                        ->required(),
                ]),
        ];
    }

    public function submit()
    {
        // dd($this->form->getState());
        $pegawai = User::whereId(auth()->id())->first();
        $pegawai->update($this->form->getState());

        $this->reset(['photo']);
        $this->notify('success', 'Your profile has been updated.');
    }
}
