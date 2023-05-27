<?php

namespace App\Http\Livewire;

use Illuminate\Database\Eloquent\Builder;
use Filament\Tables;
use Livewire\Component;
use App\Models\SKP;
use Closure;
use Illuminate\Database\Eloquent\Model;

class SKPTable extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;

    protected function getTableRecordUrlUsing(): ?Closure
    {
        return fn (Model $record): string => route('filament.pages.edit-skp/{record?}', ['record' => $record]);
    }

    protected function getTableQuery(): Builder
    {
        return SKP::query();
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('nama')->label('SKP'),
            Tables\Columns\TagsColumn::make('detail')->separator(','),
            Tables\Columns\TagsColumn::make('realisasi')->separator(','),
            // Tables\Columns\IconColumn::make('lampiran')
            //     ->options([
            //         'heroicon-o-check' => static fn ($state): bool => $state !== null,
            //         'heroicon-o-clock' => static fn ($state): bool => $state == null,
            //     ])
            //     ->colors([
            //         'success' => static fn ($state): bool => $state !== null,
            //         'danger' => static fn ($state): bool => $state == null,

            //     ]),
        ];
    }

    protected function getTableActions(): array
    {
        return [];
    }

    public function render()
    {
        return view('livewire.skp-table');
    }
}
