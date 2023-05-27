<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\SKP;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;

class Penilaian extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-bell';

    protected static string $view = 'filament.pages.penilaian';

    public $skp;

    public function mount()
    {
        $this->skp = [];
        $this->form->fill(['nama' => auth()->user()->name]);
    }

    protected function getFormSchema(): array
    {
        return [
            Grid::make()
                ->schema([
                    Select::make('pegawai')
                        ->label('Pilih Hasil SKP Pegawai')
                        ->options(SKP::where('penilai_id', auth()->id())->distinct('pegawai_id')->join('users', 'skp.pegawai_id', '=', 'users.id')->pluck('users.name', 'users.id'))
                        ->searchable()
                        ->required(),
                ]),
        ];
    }

    public function submit()
    {
        $data = $this->form->getState();
        $this->skp = SKP::where('pegawai_id', $data['pegawai'])->get();
    }
}
