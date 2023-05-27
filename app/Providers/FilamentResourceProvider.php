<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use Filament\Facades\Filament;
use Althinect\FilamentSpatieRolesPermissions\Resources\RoleResource;
use Althinect\FilamentSpatieRolesPermissions\Resources\PermissionResource;
use Filament\Navigation\NavigationItem;
use Filament\Navigation\NavigationBuilder;
use Filament\Navigation\NavigationGroup;
use App\Filament\Resources\UserResource;
use App\Filament\Resources\JabatanResource;
use App\Filament\Resources\SKPResource;
use App\Filament\Pages\Profile;
use App\Filament\Pages\Penilaian;
use App\Filament\Pages\SKPPage;
use App\Filament\Pages\LampiranSKPPage;

class FilamentResourceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        Filament::serving(function() {
            Filament::registerViteTheme('resources/css/filament.css');
            if (auth()->user()) {
                if (auth()->user()->hasRole(['admin'])) {
                    Filament::navigation(function (NavigationBuilder $builder): NavigationBuilder {
                        return $builder->items([
                            NavigationItem::make('Dashboard')
                                ->icon('heroicon-o-home')
                                ->activeIcon('heroicon-s-home')
                                ->isActiveWhen(fn (): bool => request()->routeIs('filament.pages.dashboard'))
                                ->url(route('filament.pages.dashboard')),
                        ])->groups([
                            NavigationGroup::make('Master Data')
                                ->items([
                                    ...SKPResource::getNavigationItems(),
                                    ...UserResource::getNavigationItems(),
                                    ...JabatanResource::getNavigationItems(),
                                ]),
                            NavigationGroup::make('Roles & Permissions')
                                ->items([
                                    ...RoleResource::getNavigationItems(),
                                    ...PermissionResource::getNavigationItems(),
                                ]),
                        ]);
                    });
                } elseif (auth()->user()->hasRole(['penilai'])) {
                    Filament::navigation(function (NavigationBuilder $builder): NavigationBuilder {
                        return $builder->items([
                            NavigationItem::make('Dashboard')
                                ->icon('heroicon-o-home')
                                ->activeIcon('heroicon-s-home')
                                ->isActiveWhen(fn (): bool => request()->routeIs('filament.pages.dashboard'))
                                ->url(route('filament.pages.dashboard')),
                            ...Penilaian::getNavigationItems(),
                        ])->groups([
                            NavigationGroup::make('Main Menu')
                                ->items([
                                    ...Profile::getNavigationItems(),
                                    ...SKPPage::getNavigationItems(),
                                    // ...LampiranSKPPage::getNavigationItems(),
                                ]),
                        ]);
                    });
                } else {
                    Filament::navigation(function (NavigationBuilder $builder): NavigationBuilder {
                        return $builder->items([
                            NavigationItem::make('Dashboard')
                                ->icon('heroicon-o-home')
                                ->activeIcon('heroicon-s-home')
                                ->isActiveWhen(fn (): bool => request()->routeIs('filament.pages.dashboard'))
                                ->url(route('filament.pages.dashboard')),
                        ])->groups([
                            NavigationGroup::make('Main Menu')
                                ->items([
                                    ...Profile::getNavigationItems(),
                                    ...SKPPage::getNavigationItems(),
                                    // ...LampiranSKPPage::getNavigationItems(),
                                ]),
                        ]);
                    });
                }
            }
        });
    }
}
